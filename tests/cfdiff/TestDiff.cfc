component name="TestPegdown" extends="mxunit.framework.TestCase" {

	public void function setUp()  {
		diff = new cfdiff.tag.cfdiff.cfc.diff_match_patch();
	}

	public void function testDiff()  {
		var text1 = "woohoo";
		var text2 = "wooohoo";
		debug(diff.compute(text1,text2));
	}

}