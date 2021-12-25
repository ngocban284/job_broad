Rails.configuration.stripe = { 
  :publishable_key => 'pk_test_51JifszIJOi9CH7m58aXUchBCIzJg1al1af2pC3BY1GAy2JeJsGrMJQ0VSkxn37N9Yxvms6dHArXoQRPRVaNreLM200iCp7dySF', 
  :secret_key => 'sk_test_51JifszIJOi9CH7m52iRZ4A5yW33PSPtcJxWmNE8sJlscfAG7kGPBUfglhuYJVonyw3TUOnTlO6qNSID5F2bVm1KY00WQViF0Lr' } 
  Stripe.api_key = Rails.configuration.stripe[:secret_key] 