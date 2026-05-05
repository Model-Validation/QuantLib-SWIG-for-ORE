
#ifndef quantlib_fxforward_i
#define quantlib_fxforward_i

%include ql.i
%include instruments.i
%include currencies.i
%include termstructures.i
%include calendars.i
%include date.i
%include marketelements.i
%include types.i

%{
typedef QuantLib::FxForward QlFxForward;
typedef QuantLib::DiscountingFxForwardEngine QlDiscountingFxForwardEngine;
%}

%shared_ptr(QlFxForward)
class QlFxForward : public Instrument {
  public:
    QlFxForward(Real sourceNominal,
              const Currency& sourceCurrency,
              Real targetNominal,
              const Currency& targetCurrency,
              const Date& maturityDate,
              bool paySourceCurrency,
              Natural settlementDays = 2,
              const Calendar& paymentCalendar = Calendar());
    QlFxForward(Real sourceNominal,
              const Currency& sourceCurrency,
              const Currency& targetCurrency,
              Real forwardRate,
              const Date& maturityDate,
              bool paySourceCurrency,
              Natural settlementDays = 2,
              const Calendar& paymentCalendar = Calendar());
    Real sourceNominal() const;
    const Currency& sourceCurrency() const;
    Real targetNominal() const;
    const Currency& targetCurrency() const;
    const Date& maturityDate() const;
    bool paySourceCurrency() const;
    Real forwardRate() const;
    Natural settlementDays() const;
    const Calendar& settlementCalendar() const;
    Date settlementDate() const;
    Real fairForwardRate() const;
    Real npvSourceCurrency() const;
    Real npvTargetCurrency() const;
};

%shared_ptr(QlDiscountingFxForwardEngine)
class QlDiscountingFxForwardEngine : public PricingEngine {
  public:
    QlDiscountingFxForwardEngine(
        const Handle<YieldTermStructure>& sourceCurrencyDiscountCurve,
        const Handle<YieldTermStructure>& targetCurrencyDiscountCurve,
        const Handle<Quote>& spotFx);
};

#endif
