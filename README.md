# DrawPath
This project shows how to crop view by finger drawing.

## PathView
Use _UIBezierPath_ and _CAShapeLayer_ to draw a close path and crop the view inside or outside.

### Public method

		- (void)cleanPath;
		- (void)closePathAndCropInside:(BOOL)inside;
