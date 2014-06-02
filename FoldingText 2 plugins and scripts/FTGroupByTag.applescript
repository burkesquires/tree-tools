property pTitle : "FoldingText Report - Group lines by Tags"

Creates a new report, based on the active FoldingText document.
The new document contains only tagged lines,
and these are grouped under (sorted) tag headings.
"

function(editor, options) {
	//debugger;
	var	tree = editor.tree(),
		lstTags = tree.tags(true).sort(),
		strHeadPrefix = options.grouplevel,
		strListPrefix = '- ', lstTagged = [],
		lstReport = [], strTag;

	lstTags.forEach(function(strTag) {
		var strTitle = strTag[0].toUpperCase() + strTag.slice(1);
		lstReport.push([strHeadPrefix, strTitle].join(' '));
		lstTagged = tree.evaluateNodePath('//@' + strTag);
		lstTagged.forEach(function(oNode) {
			lstReport.push(strListPrefix + oNode.text());
		});
		lstReport.push(''); // gap before next heading
	});

		return lstReport.join('\\n');
}
"