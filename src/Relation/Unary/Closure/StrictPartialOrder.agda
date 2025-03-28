------------------------------------------------------------------------
-- The Agda standard library
--
-- Closures of a unary relation with respect to a strict partial order
------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

open import Relation.Binary.Bundles using (StrictPartialOrder)

module Relation.Unary.Closure.StrictPartialOrder
       {a r e} (P : StrictPartialOrder a e r) where

open import Relation.Unary using (Pred)

open StrictPartialOrder P renaming (_<_ to _∼_)

-- Specialising the results proven generically in `Base`.
import Relation.Unary.Closure.Base _∼_ as Base
open Base public
  using (□; ◇; Closed; curry; uncurry)
  hiding (module □; module ◇)

module □ {t} {T : Pred Carrier t} where

  reindex : ∀ {x y} → x ∼ y → □ T x → □ T y
  reindex = Base.□.reindex trans

  duplicate : ∀ {x} → □ T x → □ (□ T) x
  duplicate = Base.□.duplicate trans

  closed : ∀ {t} {T : Pred Carrier t} → Closed (□ T)
  closed = Base.□.closed trans

  open Base.□ public using (map)

module ◇ {t} {T : Pred Carrier t} where

  reindex : ∀ {x y} → x ∼ y → ◇ T x → ◇ T y
  reindex = Base.◇.reindex trans

  join : ∀ {x} → ◇ (◇ T) x → ◇ T x
  join = Base.◇.join trans

  closed : Closed (◇ T)
  closed = Base.◇.closed trans

  open Base.◇ public using (map; run)
