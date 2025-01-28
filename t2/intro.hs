import Data.Maybe (fromMaybe)
import Data.List (nub)

-- Define the board size
boardSize :: Int
boardSize = 9

-- Data types for stones and board
data Stone = Black | White | Empty deriving (Eq, Show)

type Board = [[Stone]]
type Position = (Int, Int)

-- Create an empty board
emptyBoard :: Board
emptyBoard = replicate boardSize (replicate boardSize Empty)

-- Get the opposite stone color
opposite :: Stone -> Stone
opposite Black = White
opposite White = Black
opposite Empty = Empty

-- Check if a position is within bounds
isValidPos :: Position -> Bool
isValidPos (x, y) = x >= 0 && x < boardSize && y >= 0 && y < boardSize

-- Get the neighbors of a position
neighbors :: Position -> [Position]
neighbors (x, y) =
    filter isValidPos [(x-1, y), (x+1, y), (x, y-1), (x, y+1)]

-- Get the stone at a position
getStone :: Board -> Position -> Stone
getStone board (x, y) = board !! x !! y

-- Set a stone on the board
setStone :: Board -> Position -> Stone -> Board
setStone board (x, y) stone =
    take x board ++
    [take y (board !! x) ++ [stone] ++ drop (y+1) (board !! x)] ++
    drop (x+1) board

-- Get all positions in a group
groupAt :: Board -> Position -> [Position]
groupAt board pos = groupAt' board pos []
  where
    groupAt' b p visited
        | p `elem` visited = visited
        | otherwise =
            let stone = getStone b p
                sameGroup = filter (\n -> getStone b n == stone) (neighbors p)
            in foldr (groupAt' b) (p : visited) sameGroup

-- Calculate liberties for a group
liberties :: Board -> [Position] -> [Position]
liberties board group =
    nub [n | pos <- group, n <- neighbors pos, getStone board n == Empty]

-- Remove captured stones
removeCaptured :: Board -> Stone -> Board
removeCaptured board color =
    foldr removeGroup board allGroups
  where
    positions = [(x, y) | x <- [0..boardSize-1], y <- [0..boardSize-1]]
    allGroups = [groupAt board pos | pos <- positions, getStone board pos == color]
    removeGroup grp b =
        if null (liberties b grp)
        then foldr (\p acc -> setStone acc p Empty) b grp
        else b

-- Place a stone on the board
placeStone :: Board -> Position -> Stone -> Maybe Board
placeStone board pos color
    | not (isValidPos pos) || getStone board pos /= Empty = Nothing
    | otherwise =
        let newBoard = setStone board pos color
            boardAfterCapture = removeCaptured (removeCaptured newBoard (opposite color)) color
        in if null (liberties boardAfterCapture (groupAt boardAfterCapture pos))
           then Nothing  -- Suicide move
           else Just boardAfterCapture

-- Display the board
displayBoard :: Board -> IO ()
displayBoard board = mapM_ (putStrLn . unwords . map showStone) board
  where
    showStone Black = "B"
    showStone White = "W"
    showStone Empty = "."

-- Example game loop
main :: IO ()
main = gameLoop emptyBoard Black
  where
    gameLoop board color = do
        displayBoard board
        putStrLn $ "Turn: " ++ show color
        putStrLn "Enter position (x y):"
        input <- getLine
        let pos = parseInput input
        case pos of
            Just p ->
                case placeStone board p color of
                    Just newBoard -> gameLoop newBoard (opposite color)
                    Nothing -> do
                        putStrLn "Invalid move. Try again."
                        gameLoop board color
            Nothing -> do
                putStrLn "Invalid input. Try again."
                gameLoop board color
    parseInput input =
        case words input of
            [x, y] -> Just (read x, read y)
            _      -> Nothing
