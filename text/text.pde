/* @pjs font="DroidSerifBold.ttf"; */

HDrawablePool pool;
HColorPool colors;

void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();

	// type size of "60" and .size(300) acting odd / will chat on wednesday

	PFont type = createFont("DroidSerifBold.ttf", 20);
	
	// HText hitObj = new HText( "Move Fast Lift Heavy", 20, type );
		HText hitObj = new HText( "Move", 50, type );
		HText hitObj1 = new HText( "Fast", 50, type );
	H.add(hitObj).size(500).noStroke().fill(#237D26).anchorAt(H.CENTER).loc(width/2,200).visibility(false);
	H.add(hitObj1).size(500).noStroke().fill(#237D26).anchorAt(H.CENTER).loc(width/2,200).visibility(false);

	HShapeLayout hsl = new HShapeLayout().target(hitObj);
	HShapeLayout hsl2 = new HShapeLayout().target(hitObj1);

		  // colors = new HColorPool(
		  // #680305, #F36910, #C0210C, #DA9D97, #F9CDC7, #013872, #0272AA, #1C8AC7, #477CAB, #5190B1, #6B9BBF, #81A2B4, #9EB5C4, #B8C8D5, #E1E7F1)
		  //   ;

	pool = new HDrawablePool(1000);
	pool.autoAddToStage()
		.add (
			new HRect(4).rounding(2)
		)

		.colorist( new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600).fillOnly() )
		
		.layout(hsl)
		.layout(hsl2)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.size(5)
						.noStroke()
						.anchorAt(H.CENTER)
						.rotation(45)
					;
					// d.randomColors(colors.fillOnly());
				}
			}
		)

		.requestAll()
	;

	H.drawStage();
	noLoop();
}

void draw() {}

