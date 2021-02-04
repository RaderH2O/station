module CopyStation.HelperFunctions where
import System.IO
    ( hClose,
      openFile,
      hGetContents,
      hPutStr,
      openTempFile,
      IOMode(ReadMode) )
import System.Directory (copyFile, setCurrentDirectory, removeFile, renameFile)
import Data.List (delete)

saveFile :: [String] -> IO ()
saveFile locations = writeFile "locations.txt" $ unlines locations

getLocations :: IO [String]
getLocations = do
    a <- readFile "locations.txt"
    return $ lines a

copyFromList :: [String] -> IO ()
copyFromList (file:path:_) = do
    locs <- getLocations
    copyFile file (locs !! (read path - 1) ++ file)

cdFromList :: [String] -> IO ()
cdFromList (dir:_) = do
    locs <- getLocations
    setCurrentDirectory $ locs !! (read dir - 1)

listLocations :: [String] -> IO ()
listLocations _ = do
    s <- getLocations
    putStrLn $ unlines $ zipWith (\x y -> (show x ++ " - ") ++ y) [1..] s

removeFromList :: [String] -> IO ()
removeFromList (file:dir:_) = do
    locs <- getLocations
    removeFile ((locs !! (read dir - 1)) ++ file)

addlocFromList :: [String] -> IO ()
addlocFromList (loc:_) = do
    fileHandle <- openFile "locations.txt" ReadMode
    content <- hGetContents fileHandle
    (tempFileName, tempFileHandle) <- openTempFile "." "temp"
    let locs = lines content
    hPutStr tempFileHandle (unlines $ locs ++ [loc])
    hClose fileHandle
    hClose tempFileHandle
    removeFile "locations.txt"
    renameFile tempFileName "locations.txt"

rmlocFromList :: [String] -> IO ()
rmlocFromList (loc:_) = do
    fileHandle <- openFile "locations.txt" ReadMode
    content <- hGetContents fileHandle
    (tempFileName, tempFileHandle) <- openTempFile "." "temp"
    let locs = lines content
    hPutStr tempFileHandle (unlines $ delete (locs !! (read loc - 1)) locs)
    hClose fileHandle
    hClose tempFileHandle
    removeFile "locations.txt"
    renameFile tempFileName "locations.txt"