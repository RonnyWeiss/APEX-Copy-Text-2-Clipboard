function apexCopy2ClipBoard(self, wait, message, strLength) {
    var util = {
        version: "1.0.3",
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
        }
    };

    var $temp = $("<input>");
    $("body").append($temp);
    var str = $(self.affectedElements).text() || $(self.affectedElements).val();
    $temp.val(str).select();
    document.execCommand("copy");
    $temp.remove();
    if ((wait || 0) > 0 && str) {
        apex.message.showPageSuccess(message.replace("%0", util.cutString(str, strLength || 15)));
        setTimeout(function () {
            apex.message.hidePageSuccess();
        }, wait);
    }
}
