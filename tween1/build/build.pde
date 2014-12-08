import processing.pdf.*;


HColorPool colors;
HRandomTrigger tweenTrigger;

boolean paused = false;
boolean record = false;


void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();

	colors = new HColorPool()
		.add(#FFFFFF)  //white
		.add(#FF0000, 2) //red
		.add(#0000FF, 2)	//blue
		;

	tweenTrigger = new HRandomTrigger( 1f/15 );

	tweenTrigger.callback(
		new HCallback(){
			public void run(Object obj) {
				final HDrawable r = H.add( new HShape("reebok5.svg") )
					.enableStyle(false)
					.noStroke()
					.fill( colors.getColor() )
					.loc( width/2, height/2 )
					.anchorAt( H.CENTER )
					.size( 20 + ( (int)random(4) * 50 ) ) // 50, 100, 150, 200
					.rotate( (int)random(4) * 90 )
				;

				final HTween tween = new HTween()
					.target(r).property(H.LOCATION)
					.start( width/2, height/2 )
					.end( (int)random(width), (int)random(height) )
					.ease(0.01)
					.spring(0.9)
				;
			}
		}
	);
}

void draw() {
	H.drawStage();
}


// pause, restart, advance 1 / with key presses

// spacebar = pause and restart animation
// +        = redraw() advances 1 iteration in the animation
// r        = render to PDF
// c        = recolor and redraw() advances 1 iteration in the animation

void keyPressed() {
	if (key == ' ') {
		if (paused) { 
			loop();
			paused = false;
		} else {
			noLoop();
			paused = true;
		}
	}

	if (key == '+') {
		redraw();
	}

	if (key == 'r') { //record vector with r
		record = true;
		saveVector();
	}

	// if (key == 'c') {
	// 	for (HDrawable temp : pool) {
	// 		HShape d = (HShape) temp;
	// 		d.randomColors(colors.strokeOnly());
	// 	}
	// 	redraw();
	// }
}

void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "render_#####.pdf");

	if (tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
	}

	endRecord();
}










