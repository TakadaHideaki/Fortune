import FirebaseFunctions

class StripeCostomerRepository {

    lazy var functions = Functions.functions()

    //index.tsでAPIを叩きcustomerIdを取得
    func createCustomerId(email: String, completion: ((String?, Error?) -> Void)?){
        let data: [String: Any] = [
            "email": email
        ]
        functions.httpsCallable("createStripeCustomer")
            .call(data) { result, error in

                if let error = error {
                    completion!(nil, error)
                } else if let data = result?.data as? [String: Any],
                    let customerId = data["customerId"] as? String {
                    completion!(customerId, nil)
                }
        }
    }

}
