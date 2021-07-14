function apexCopy2ClipBoard(self, wait, message, strLength, cssFilter) {
    var util = {
        "featureDetails": {
            name: "apexCopy2ClipBoard",
            scriptVersion: "1.0.5",
            utilVersion: "1.4",
            url: "https://github.com/RonnyWeiss",
            url2: "https://linktr.ee/ronny.weiss",
            license: "MIT"
        },
        isDefinedAndNotNull: function (pInput) {
            if (typeof pInput !== "undefined" && pInput !== null && pInput != "") {
                return true;
            } else {
                return false;
            }
        },
        cutString: function (text, textLength) {
            try {
                if (textLength < 0) return text;
                else {
                    return (text.length > textLength) ?
                        text.substring(0, textLength - 3) + "..." :
                        text
                }
            } catch (e) {
                return text;
            }
        },
        copy2Clipboard: function (pElement) {
            var $temp = $("<input>");
            $("body").append($temp);
            var str = $(pElement).text() || $(pElement).val();
            $temp.val(str).select();
            document.execCommand("copy");
            $temp.remove();
        }
    };

    function checkClassFilter(pEl, pFilter) {
        if (util.isDefinedAndNotNull(pFilter)) {
            if ($(pEl).hasClass(pFilter)) {
                return true;
            } else {
                return false;
            }
        } else {
            return true;
        }
    }

    var affEl = self.affectedElements;

    $.each(affEl, function (i, cEl) {
        if (checkClassFilter(cEl, cssFilter)) {
            util.copy2Clipboard(cEl);

            var str = $(cEl).text() || $(cEl).val();
            if ((wait || 0) > 0 && util.isDefinedAndNotNull(str)) {
                apex.message.showPageSuccess(message.replace("%0", util.cutString(str.trim(), strLength || 15)));
                if (!window.apexCopy2ClipBoardTimer) {
                    window.apexCopy2ClipBoardTimer = setTimeout(function () {
                        apex.message.hidePageSuccess();
                    }, wait);
                } else {
                    clearTimeout(window.apexCopy2ClipBoardTimer);
                    window.apexCopy2ClipBoardTimer = setTimeout(function () {
                        apex.message.hidePageSuccess();
                    }, wait);
                }
            }
        }
    });
}
