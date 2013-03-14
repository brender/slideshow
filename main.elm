import Input
import Graphics
import Signal 

main = lift2 beside sidebar slideshowContainer

(firstImageField, input) = textField "First Image"

firstImageFieldSignal = constant firstImageField

slideshow = images input

slideshowContainer = lift4 container (lift widthOf slideshow) Window.height (constant middle) slideshow

sidebar = lift4 container (constant (widthOf firstImageField)) Window.height (constant midLeft) firstImageFieldSignal

-- http://www.adogabouttown.com/wp-content/uploads/2008/08/american-crow.jpg