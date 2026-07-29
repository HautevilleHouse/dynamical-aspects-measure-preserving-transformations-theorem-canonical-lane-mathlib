import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MeasurePreservingTransformations

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure ErgodicDecompositionPackage (X : Type u) (D : DynamicalSystem X) where
  ergodicComponents : List (ErgodicComponent X D)
  decompositionCover : Set X = ⋃ (c : ErgodicComponent X D), c.invariantSet
  pairwiseDisjoint : ∀ i j, i ≠ j → (i.invariantSet ∩ j.invariantSet = ∅)

structure ErgodicDecompositionEvidence {X : Type u} {D : DynamicalSystem X} (E : ErgodicDecompositionPackage X D) where
  decompositionCoverClosed : E.decompositionCover
  pairwiseDisjointClosed : E.pairwiseDisjoint

def ErgodicDecompositionClosed {X : Type u} {D : DynamicalSystem X} (E : ErgodicDecompositionPackage X D) : Prop :=
  E.decompositionCover ∧ E.pairwiseDisjoint

theorem ergodic_decomposition_closed_from_evidence {X : Type u} {D : DynamicalSystem X} (E : ErgodicDecompositionPackage X D) (Ev : ErgodicDecompositionEvidence E) :
  ErgodicDecompositionClosed E := by
  exact And.intro Ev.decompositionCoverClosed Ev.pairwiseDisjointClosed

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse