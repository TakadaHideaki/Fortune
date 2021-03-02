import Stripe
import FirebaseFunctions

class StripeAPIClient: NSObject, STPCustomerEphemeralKeyProvider {
    lazy var functions = Functions.functions()
    let customerId: String
    
    init(customerId: String){
        self.customerId = customerId
    }
    //Stripeサーバーに customerId/stripe_version を渡し新しいStripeアカウント作成
    func createCustomerKey(withAPIVersion apiVersion: String, completion: @escaping STPJSONResponseCompletionBlock) {
        let data: [String: Any] = ["customerId": customerId, "stripe_version": apiVersion]
        functions
            .httpsCallable("createStripeEphemeralKeys")
            .call(data) { result, error in
                
                if let error = error {
                    completion(nil, error)
                } else if let data = result?.data as? [String: Any] {
                    completion(data, nil)
                }
            }
    }
}


