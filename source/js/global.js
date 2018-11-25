
function addCopyHandler(buttonId, textFieldId) {
    try {
        var btn = document.querySelector('#' + buttonId);
        if (btn !== null) {
            btn.addEventListener('click', function() {
                var text = document.querySelector('#' + textFieldId);
                if (text !== null) {
                    text.select();
                    document.execCommand('copy');
                }
            }, false);
        }
    } catch (e) {
        // ...
    }
}

function addFileChangeHandler(fileId, labelId) {
    try {
        var file = document.querySelector('#' + fileId);
        var label = document.querySelector('#' + labelId);

        if (file !== null && label !== null) {
            file.addEventListener('change', function(e) {
                var filename = e.target.value.split('\\').pop();
                if (filename) {
                    label.innerHTML = filename;
                }
            });
        }
    } catch (e) {
        // ...
    }
}