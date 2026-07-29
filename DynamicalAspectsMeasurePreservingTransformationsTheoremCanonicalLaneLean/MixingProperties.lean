import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MeasurePreservingStructure

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure MixingProperties (M : MeasurePreservingStructure) where
  strongMixing : Prop
  weakMixing : Prop
  mixingCoefficient : Type u
  correlationDecay : Prop

structure MixingEvidence {M : MeasurePreservingStructure} (Mx : MixingProperties M) where
  strongMixingClosed : Mx.strongMixing
  weakMixingClosed : Mx.weakMixing
  correlationDecayClosed : Mx.correlationDecay

def MixingClosed {M : MeasurePreservingStructure} (Mx : MixingProperties M) : Prop :=
  Mx.strongMixing ∧ Mx.weakMixing ∧ Mx.correlationDecay

theorem mixing_closed_from_evidence {M : MeasurePreservingStructure} (Mx : MixingProperties M)
    (E : MixingEvidence Mx) : MixingClosed Mx := by
  exact And.intro E.strongMixingClosed (And.intro E.weakMixingClosed E.correlationDecayClosed)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
