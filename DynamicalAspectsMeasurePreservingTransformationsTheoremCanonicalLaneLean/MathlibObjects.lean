import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MeasurePreservingSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  measure : carrier → ℝ
  dynamics : carrier → carrier

structure MeasurePreservingAdmittedObject where
  space : MeasurePreservingSpace
  invariantMeasure : Prop
  ergodic : Prop
  mixing : Prop
  conclusion : invariantMeasure ∧ ergodic ∧ mixing

structure MeasurePreservingEndgameState where
  object : MeasurePreservingAdmittedObject

def MeasurePreservingWitnessClosed (O : MeasurePreservingAdmittedObject) : Prop :=
  O.conclusion

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
