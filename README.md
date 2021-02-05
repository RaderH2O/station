### Station
## Usage
```
./station addloc /home/user/Desktop/
```
This adds the path `/home/user/Desktop/` to the main paths

```
./station rmloc 1
```
This removes the location with the ID 1

```
./station list
```
Lists the locations , with their IDs (which you use to interact with them)

```
./station rm filename 1
```
Deletes the file "filename" located in the location with the ID 1 (the first location)

```
./station cp filename 1
```
Copies the file "filename" to the location with the ID 1 (the first location)

## Installation

Either use `cabal` to build :
```
cd station/
cabal install
cabal build
```
And run with :
```
cabal run
```
Or download from releases (https://github.com/RaderH2O/station/releases)
