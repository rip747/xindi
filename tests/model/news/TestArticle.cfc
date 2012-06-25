/*
	Xindi - http://www.getxindi.com/
	
	Copyright (c) 2012, Simon Bingham
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
	files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
	modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
	is furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
	IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

component extends="mxunit.framework.TestCase"{
			
	// ------------------------ TESTS ------------------------ //
	 
	function testGetSummaryDoesNotAppendHellipIfShort(){
		CUT.setContent( "<p>short page content</p>" );
		assertEquals( "short page content", CUT.getSummary() );
	}

	function testGetSummaryIsPlainText(){
		CUT.setContent( "<p>some <strong class='foo'>page</strong> content</p>" );
		assertEquals( "some page content", CUT.getSummary() );
	}
	
	function testGetSummaryTruncatesAndAppendsHellipIfLong(){
		CUT.setContent( "<p>This is a long description which is over five-hundred characters in length - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultrices purus non velit adipiscing malesuada. Aliquam sed convallis neque. Praesent vulputate suscipit luctus. Integer nec neque non dolor eleifend commodo. Mauris consectetur, augue ut pretium lobortis, lectus dui mattis velit, quis venenatis arcu leo non ipsum. Quisque sit amet tortor nec orci lobortis aliquet eget ac erat. Cras rhoncus molestie tincidunt. Vestibulum feugiat aliquam sapien id pharetra. Sed viverra turpis a neque molestie sed venenatis turpis sollicitudin. Duis eu nisl in lacus luctus molestie ac nec turpis. Maecenas vel orci eget purus suscipit aliquam ut id enim. Maecenas euismod, arcu et vestibulum laoreet, sem nisl ultrices arcu, vitae elementum leo leo at tortor. Aliquam erat volutpat. Curabitur eu pellentesque lorem. Donec at nisl erat. Mauris ornare posuere dui a sollicitudin. Quisque quis diam ligula, sed feugiat mauris. In hac habitasse platea dictumst. In condimentum, urna id imperdiet lobortis, mauris justo bibendum ante, sed malesuada nulla elit ac quam. In pellentesque, orci et mattis cursus, urna urna tincidunt sapien, sollicitudin molestie libero mi ac eros. Curabitur elementum felis vel nisi fermentum vehicula. Suspendisse vitae suscipit neque. Sed est ipsum, tempor id sodales in, tempus eget dolor. Quisque nulla mi, posuere sit amet porttitor in, adipiscing quis elit. Morbi vitae lectus felis. Fusce bibendum, quam auctor pellentesque faucibus, quam diam bibendum risus, sit amet malesuada enim lectus in nisl. Aenean blandit molestie risus nec vulputate. Morbi nec sodales sapien. Donec varius porttitor leo, ac vehicula turpis ornare sit amet. In hac habitasse platea dictumst.</p>" );
		var result = CUT.getSummary();
		assertTrue( Len( result ) == 503 );
		assertTrue( Right( result, 3 ) == "..." );
	}
	
	// ------------------------ IMPLICIT ------------------------ //
	
	/**
	* this will run before every single test in this test case
	*/
	function setUp(){
		CUT = new model.news.Article(); 
	}
	
	/**
	* this will run after every single test in this test case
	*/
	function tearDown(){}
	
	/**
	* this will run once after initialization and before setUp()
	*/
	function beforeTests(){}
	
	/**
	* this will run once after all tests have been run
	*/
	function afterTests(){}

}