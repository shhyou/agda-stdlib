------------------------------------------------------------------------
-- The Agda standard library
--
-- Exponentiation over a semiring optimised for type-checking.
------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

open import Algebra.Bundles using (CommutativeSemiring)


module Algebra.Properties.CommutativeSemiring.Exp.TCOptimised
  {a ℓ} (S : CommutativeSemiring a ℓ) where

open CommutativeSemiring S
open import Relation.Binary.Reasoning.Setoid setoid

import Algebra.Properties.CommutativeMonoid.Mult.TCOptimised *-commutativeMonoid as Mult

------------------------------------------------------------------------
-- Re-export definition and properties for semirings
open import Data.Nat.Base as ℕ using (zero; suc)
import Data.Nat.Properties as ℕ using (+-assoc; +-identityˡ; +-identityʳ)
open import Relation.Binary.PropositionalEquality.Core using (_≡_)
open import Algebra.Properties.Semiring.Exp.TCOptimised semiring public

------------------------------------------------------------------------
-- Properties

^-distrib-* : ∀ x y n → (x * y) ^ n ≈ x ^ n * y ^ n
^-distrib-* = Mult.×-distrib-+
