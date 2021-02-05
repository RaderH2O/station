module Main where
import System.Environment ( getArgs )
import CopyStation.HelperFunctions
    ( getLocations,
      copyFromList,
      listLocations,
      removeFromList,
      addlocFromList,
      rmlocFromList )

associations :: [(String, [String] -> IO ())]
associations = [ ("cp", copyFromList)
               , ("list", listLocations)
               , ("rm", removeFromList)
               , ("addloc", addlocFromList)
               , ("rmloc", rmlocFromList) ]

fromJust (Just a) = a

main :: IO ()
main = do
        args <- getArgs
        locs <- getLocations
        fromJust $ lookup (head args) associations <*> Just (tail args)
