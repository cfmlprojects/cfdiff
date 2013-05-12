component {

	function init() {
		return this;
	}

	function compute(String text1, String text2, type ="diff_main") {
		var sys = createObject("java","java.lang.System");
		var jThread = createObject("java","java.lang.Thread");
		var cTL = jThread.currentThread().getContextClassLoader();
   		classLoader = new LibraryLoader(getDirectoryFromPath(getMetaData(this).path) & "lib/").init();
		jThread.currentThread().setContextClassLoader(classLoader.GETLOADER().getURLClassLoader());
		try{
			var diff_match_patch = classLoader.create("name.fraser.neil.plaintext.diff_match_patch");
			var diffOb = diff_match_patch[type](text1,text2);
			var returnStruct = {
				diff = diffOb,
				html = diff_match_patch.diff_prettyHtml(diffOb),
				text1 = diff_match_patch.diff_text1(diffOb),
				text2 = diff_match_patch.diff_text2(diffOb)
			};
			return returnStruct;
		} catch (any e) {
			jThread.currentThread().setContextClassLoader(cTL);
			throw(e);
		} finally {
			jThread.currentThread().setContextClassLoader(cTL);
		}
	}

}