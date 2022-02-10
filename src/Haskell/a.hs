module A where

foreign export ccall foo :: Int -> Int

foo :: Int -> Int
foo a = a + 5