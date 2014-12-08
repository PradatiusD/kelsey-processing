/* @pjs font="DroidSerifBold.ttf"; */

void addVectorShapestoShapeLayout(HShapeLayout shapeLayout, HColorPool desiredColors){
	HDrawablePool pool = new HDrawablePool(1000);

	pool.autoAddToStage()
		.add (new HRect(4).rounding(2))
		.colorist(desiredColors.fillOnly())
		.layout(shapeLayout)
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
				}
			}
		)
		.requestAll()
	;
}

void createShapeLayout (PFont type, String word, float w, float h, HColorPool desiredColors) {

	HText hitObj = new HText( word, 50, type);
	
	H.add(hitObj)
		.size(500)
		.noStroke()
		.anchorAt(H.CENTER)
		.loc(w,h)
		.visibility(false);

	HShapeLayout hsl = new HShapeLayout().target(hitObj);
	addVectorShapestoShapeLayout(hsl, desiredColors);
}

void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();

	PFont type = createFont("DroidSerifBold.ttf", 20);
	HColorPool colors = new HColorPool(#680305, #F36910, #C0210C, #DA9D97, #F9CDC7, #013872, #0272AA, #1C8AC7, #477CAB, #5190B1, #6B9BBF, #81A2B4, #9EB5C4, #B8C8D5, #E1E7F1);
	
	createShapeLayout(type, "Move", width/2, -100, colors);
	createShapeLayout(type, "Fast", width/2,   50, colors);
	createShapeLayout(type, "Lift", width/2,  200, colors);
	createShapeLayout(type, "Heavy", width/2, 350, colors);

	H.drawStage();
	noLoop();
}

void draw() {}

