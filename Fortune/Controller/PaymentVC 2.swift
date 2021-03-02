import UIKit
import Stripe


class PaymentVC: UIViewController, STPPaymentContextDelegate {
   
    private var paymentContext: STPPaymentContext?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func a(_ sender: Any) {
    
        let customerId = "firestoreから取得"
        let customerContext = STPCustomerContext(keyProvider: StripeAPIClient(customerId: customerId))
        paymentContext = STPPaymentContext(customerContext: customerContext)
        paymentContext!.delegate = self
        paymentContext!.hostViewController = self
        paymentContext!.paymentAmount = 5000
        paymentContext!.presentPaymentOptionsViewController()
    }
    
    
    
    func paymentContextDidChange(_ paymentContext: STPPaymentContext) {
        
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didFailToLoadWithError error: Error) {
        
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didCreatePaymentResult paymentResult: STPPaymentResult, completion: @escaping STPPaymentStatusBlock) {
        
    }
    
    func paymentContext(_ paymentContext: STPPaymentContext, didFinishWith status: STPPaymentStatus, error: Error?) {
        
    }
    

    
        
     
    
    



}
