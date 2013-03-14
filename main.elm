import Input
import Graphics
import Signal 

main = lift2 beside firstImageFieldSignal slideshow

(firstImageField, input) = textField "First Image"

firstImageFieldSignal = constant firstImageField

slideshow = images input

-- http://www.adogabouttown.com/wp-content/uploads/2008/08/american-crow.jpg