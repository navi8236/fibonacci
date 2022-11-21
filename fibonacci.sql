SET NOCOUNT ON;

-- Set Initial Values
DECLARE @Fb TABLE
(
    Iteration INT     IDENTITY(1, 1) NOT NULL,
    Fibonacci NUMERIC NOT NULL
)

DELETE FROM @Fb;

INSERT INTO @Fb
(
    Fibonacci
)
SELECT 0 AS FibNumber
UNION
SELECT 1 

-- Setup recursion to generate series
DECLARE @CurrentIteration INT =
        (
            SELECT MIN (f.Iteration)
            FROM   @Fb AS f
        )
        
-- Define max iterations needed
DECLARE @iterations INT = 10

-- Execute
WHILE @CurrentIteration <= @iterations
BEGIN
    INSERT INTO @Fb
    (
        Fibonacci
    )
    SELECT SUM (f.Fibonacci)
    FROM   @Fb AS f
    -- change pointers to new positions on each iteration and sum them for next number
    WHERE  f.Iteration IN ( @CurrentIteration, (@CurrentIteration + 1))

    SET @CurrentIteration += 1;
END

-- Display result
SELECT STRING_AGG (f.Fibonacci, ',')+'...' AS Fibonacci
FROM   @Fb AS f