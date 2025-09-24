const fs = require('fs');

async function fetchFile(github, context, path) {
    const content = await github.rest.repos.getContent({
        owner: context.repo.owner,
        repo: context.repo.repo,
        path: path,
        ref: "main"
    })
    const { data: data } = await github.request(content.data.download_url)
    return {
        data: data,
        sha: content.data.sha
    }
}

function generateCases(styleDef) {
    var buffer = "";

    for (const key in styleDef) {
        buffer += `    case ${key}\n`
    }

    return buffer;
}

function generateFontStyle(styleDef) {
    const specialTypes = {
        "largeTitle": "title1",
        "preamble": "body",
        "subhead1": "subheadline",
        "subhead2": "subheadline",
        "label1": "subheadline",
        "label2": "subheadline",
        "collectionLabel": "subheadline",
        "icon": "subheadline",
        "iconLarge": "subheadline"
    }

    var buffer = "";

    for (const key in styleDef) {
        if (key in specialTypes) {
            buffer += `
        case .${key}:
            return .${specialTypes[key]}`
        } else {
            buffer += `
        case .${key}:
            return .${key}`
        }
    }

    return buffer;
}

function generateFontWeight(styleDef) {
    var buffer = "";

    for (const key in styleDef) {
        buffer += `
        case .${key}:
            return ${styleDef[key].weight}`
    }

    return buffer;
}

function generateLineHeight(styleDef) {
    var buffer = "";

    for (const key in styleDef) {
        buffer += `
        case .${key}:
            return ${styleDef[key].lineHeight ?? "nil"}`
    }

    return buffer;
}

function generateKerning(styleDef) {
    var buffer = "";

    for (const key in styleDef) {
        buffer += `
        case .${key}:
            return ${styleDef[key].letterSpacing ?? "nil"}`
    }

    return buffer;
}

function generatePointSize(styleDef) {
    var buffer = "";

    for (const key in styleDef) {
        buffer += `
        case .${key}:
            return ${styleDef[key].size}`
    }

    return buffer;
}

function generateFontWidth(styleDef) {
    var buffer = "";

    for (const key in styleDef) {
        const width = styleDef[key].width;
        if (width === 80) {
            buffer += `
            case .${key}:
                return .condensed`;
        } else {
            buffer += `
            case .${key}:
                return nil`;
        }
    }

    return buffer;
}

function expandTemplate(template, styles) {
    template = template.replace("<%casesiOS%>", generateCases(styles.responsive));
    template = template.replace("<%casestvOS%>", generateCases(styles.tv));

    template = template.replace("<%fontStyleiOS%>", generateFontStyle(styles.responsive));
    template = template.replace("<%fontStyletvOS%>", generateFontStyle(styles.tv));

    template = template.replace("<%fontWeightiOS%>", generateFontWeight(styles.responsive));
    template = template.replace("<%fontWeighttvOS%>", generateFontWeight(styles.tv));

    template = template.replace("<%lineHeightiOS%>", generateLineHeight(styles.responsive));
    template = template.replace("<%lineHeighttvOS%>", generateLineHeight(styles.tv));

    template = template.replace("<%kerningiOS%>", generateKerning(styles.responsive));
    template = template.replace("<%kerningtvOS%>", generateKerning(styles.tv));

    template = template.replace("<%pointSizeiOS%>", generatePointSize(styles.responsive));
    template = template.replace("<%pointSizetvOS%>", generatePointSize(styles.tv));

    template = template.replace("<%widthiOS%>", generateFontWidth(styles.responsive));
    template = template.replace("<%widthtvOS%>", generateFontWidth(styles.tv));

    return template;
}

function createDefinition(styles) {
    const templateData = fs.readFileSync('./ios/template', 'utf8');
    const expanded = expandTemplate(templateData, styles);
    return expanded
}

async function generateSwift(github, context, exec, forced = false) {
    const styles = JSON.parse(fs.readFileSync('styles.json', 'utf8'));

    const originalFile = await fetchFile(github, context, 'ios/NRKSansStyle.swift');
    const newData = createDefinition(styles);

    if (newData == originalFile.data && !forced) {
        console.log("No changes in generated file");
        return;
    }

    const response = await github.rest.repos.createOrUpdateFileContents({
        owner: context.repo.owner,
        repo: context.repo.repo,
        branch: 'main',
        path: 'ios/NRKSansStyle.swift',
        message: ':robot: Update iOS & tvOS styles',
        content: Buffer.from(newData).toString('base64'),
        sha: originalFile.sha
    });
}

module.exports = async (github, context, exec, forced) => {
    return generateSwift(github, context, exec, forced);
}
