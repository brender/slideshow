import Input
import Graphics
import Signal
import Time

(firstImageField, input1) = textField "First Image"
(secondImageField, input2) = textField "Second Image"

main = lift2 beside sidebar slideshowContainer

imageFieldsSignal = constant (flow down [ firstImageField, secondImageField ])

slideshow = images (switchEvery input1 input2 second)

slideshowContainer = lift4 container (lift widthOf slideshow) Window.height (constant middle) slideshow

sidebar = lift4 container (constant (widthOf firstImageField)) Window.height (constant midLeft) imageFieldsSignal

-- switchEvery :: Signal a -> Signal a -> Time -> Signal a
--      Switches between the two signals every 't' seconds.
--
-- (switchEvery input1 input2 (second / 2))
switchEvery a b t =
    let ta = every (t * 2)
        tb = delay t ta
    in merge (sampleOn ta a) (sampleOn tb b)

-- http://www.adogabouttown.com/wp-content/uploads/2008/08/american-crow.jpg
-- http://brender.github.com/crows/crow1.jpg