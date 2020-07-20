function apexCopy2ClipBoard(self, wait, message, strLength) {
    var util = {
        /**********************************************************************************
         ** required functions 
         *********************************************************************************/
        featureInfo: {
            name: "apexCopy2ClipBoard",
            info: {
                scriptVersion: "1.0.4",
                utilVersion: "1.3.4",
                url: "https://github.com/RonnyWeiss",
                license: "MIT"
            }
        },
        isDefinedAndNotNull: function (pInput) {
            if (typeof pInput !== "undefined" && pInput !== null && pInput != "") {
                return true;
            } else {
                return false;
            }
        },
        isAPEX: function () {
            if (typeof (apex) !== 'undefined') {
                return true;
            } else {
                return false;
            }
        },
        varType: function (pObj) {
            if (typeof pObj === "object") {
                var arrayConstructor = [].constructor;
                var objectConstructor = ({}).constructor;
                if (pObj.constructor === arrayConstructor) {
                    return "array";
                }
                if (pObj.constructor === objectConstructor) {
                    return "json";
                }
            } else {
                return typeof pObj;
            }
        },
        debug: {
            info: function () {
                if (util.isAPEX()) {
                    var i = 0;
                    var arr = [];
                    for (var prop in arguments) {
                        arr[i] = arguments[prop];
                        i++;
                    }
                    arr.push(util.featureInfo);
                    apex.debug.info.apply(this, arr);
                }
            },
            error: function () {
                var i = 0;
                var arr = [];
                for (var prop in arguments) {
                    arr[i] = arguments[prop];
                    i++;
                }
                arr.push(util.featureInfo);
                if (util.isAPEX()) {
                    apex.debug.error.apply(this, arr);
                } else {
                    console.error.apply(this, arr);
                }
            }
        },
        /**********************************************************************************
         ** optinal functions 
         *********************************************************************************/
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

    util.copy2Clipboard(self.affectedElements);

    var str = $(self.affectedElements).text() || $(self.affectedElements).val();
    if ((wait || 0) > 0 && util.isDefinedAndNotNull(str)) {
        apex.message.showPageSuccess(message.replace("%0", util.cutString(str, strLength || 15)));
        setTimeout(function () {
            apex.message.hidePageSuccess();
        }, wait);
    }
}
