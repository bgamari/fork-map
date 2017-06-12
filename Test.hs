{-# LANGUAGE StaticPointers #-}

import qualified Pipes as P
import qualified Pipes.Prelude as P.P
import qualified Control.Concurrent.ForkMap as FM
import Control.Concurrent

main :: IO ()
main = do
    P.runEffect $ FM.mapIO 10 4 (static FM.Dict) (static f) (P.each [1..10 :: Int]) P.>-> P.P.print
  where
    f x = do
        threadDelay (100*1000)
        return (x+1)
