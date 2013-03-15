import Input
import Graphics
import Signal
import Time

(firstImageField, input1) = textField "First Image URL"
(secondImageField, input2) = textField "Second Image URL"
(thirdImageField, input3) = textField "Third Image URL"

main = lift2 beside sidebar slideshowContainer

imageFieldsSignal = constant (flow down [ firstImageField, secondImageField, thirdImageField ])

slideshow = images (switchEvery input1 input2 input3 (second / 4))

slideshowContainer = lift4 container (lift widthOf slideshow) Window.height (constant middle) slideshow

sidebar = lift4 container (constant (widthOf firstImageField)) Window.height (constant midLeft) imageFieldsSignal

-- switchEvery :: Signal a -> Signal a -> Signal a -> Time -> Signal a
--      Switches between the two signals every 't' seconds.
--
-- (switchEvery input1 input2 input3 (second / 2))
switchEvery a b c t =
    let ta = every (t * 3)
        tb = delay t ta
        tc = delay t tb 
    in merges [ (sampleOn ta a), (sampleOn tb b), (sampleOn tc c) ]

-- http://www.adogabouttown.com/wp-content/uploads/2008/08/american-crow.jpg
-- http://brender.github.com/crows/crow1.jpg
-- http://www.britannica.com/blogs/wp-content/uploads/2009/07/crow1.jpg