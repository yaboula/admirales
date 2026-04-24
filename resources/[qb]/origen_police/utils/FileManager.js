const fs = require('fs');
const nodePath = require('path');

const RESOURCE_ROOT = nodePath.resolve(GetResourcePath('origen_police'));

function safePath(inputPath) {
    if (typeof inputPath !== 'string') {
        throw new Error('[origen_police][SECURITY] FileManager: non-string path rejected');
    }
    const candidate = nodePath.resolve(RESOURCE_ROOT + nodePath.sep + inputPath.replace(/\\/g, '/'));
    if (candidate !== RESOURCE_ROOT && !candidate.startsWith(RESOURCE_ROOT + nodePath.sep)) {
        console.error('[origen_police][SECURITY] FileManager: path traversal blocked — "' + inputPath + '"');
        throw new Error('Access denied: path outside resource root');
    }
    return candidate;
}

global.exports('GetFileList', (inputPath) => {
    return fs.readdirSync(safePath(inputPath));
});

global.exports('ReadFile', (inputPath) => {
    return fs.readFileSync(safePath(inputPath), 'utf8');
});

global.exports('CreateFile', (inputPath, data) => {
    fs.writeFileSync(safePath(inputPath), String(data));
});

global.exports('WriteFile', (inputPath, data) => {
    fs.writeFileSync(safePath(inputPath), String(data));
});

global.exports('DeleteFile', (inputPath) => {
    fs.unlinkSync(safePath(inputPath));
});
