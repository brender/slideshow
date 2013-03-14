import Input
import Graphics
import Signal 

main = lift2 beside sidebar slideshow

(firstImageField, input) = textField "First Image"

firstImageFieldSignal = constant firstImageField

slideshow = images input

sidebar = lift4 container (constant (widthOf firstImageField)) Window.height (constant midLeft) firstImageFieldSignal

-- http://www.adogabouttown.com/wp-content/uploads/2008/08/american-crow.jpg