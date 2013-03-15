import Input
import Graphics
import Signal
import Time

(firstImageField, input1) = textField "First Image URL"
(secondImageField, input2) = textField "Second Image URL"
(thirdImageField, input3) = textField "Third Image URL"



main = lift2 beside sidebar slideshowContainer

imageFieldsSignal = constant (flow down [ firstImageField, secondImageField, thirdImageField ])

maybeString1 = lift2 maybeString input1 (constant "http://www.adogabouttown.com/wp-content/uploads/2008/08/american-crow.jpg") 
maybeString2 = lift2 maybeString input2 (constant "http://brender.github.com/crows/crow1.jpg")
maybeString3 = lift2 maybeString input3 (constant "http://www.britannica.com/blogs/wp-content/uploads/2009/07/crow1.jpg")

slideshow = images (switchEvery maybeString1 maybeString2 maybeString3 (second / 4))

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

-- maybeString :: String -> String -> String
--      Returns the first string, unless it's empty, in which case the default is returned.
maybeString s d =
    if s == "" then d else s 

-- http://www.adogabouttown.com/wp-content/uploads/2008/08/american-crow.jpg
-- http://brender.github.com/crows/crow1.jpg
-- http://www.britannica.com/blogs/wp-content/uploads/2009/07/crow1.jpg