import Foundation
import Validator

struct Validation_Error: ValidationError {
    let message: String
    init(_ message: String) {
        self.message = message
    }
}

class Validation {
    
    //シングルトンが良いか？
    
    internal init(name_TextField: UITextField? = nil,
                  email_TextField: UITextField? = nil,
                  password_TextField: UITextField? = nil,
                  selfIntroduction_TextView: UITextView? = nil) {
        
        self.name_TextField = name_TextField
        self.email_TextField = email_TextField
        self.password_TextField = password_TextField
        self.selfIntroduction_TextView = selfIntroduction_TextView
    }
    
    private var name_TextField: UITextField?
    private var email_TextField: UITextField?
    private var password_TextField: UITextField?
    private var selfIntroduction_TextView: UITextView?
    
    
    let nameCharacterCountRule = ValidationRuleLength(min: 1, max: 20, error: Validation_Error("erro"))
    let emailRule = ValidationRulePattern(pattern: EmailValidationPattern.standard,
                                          error: Validation_Error("erro"))
    let passwoardCharacterCountRule = ValidationRuleLength(min: 6, max: 12, error: Validation_Error("erro"))
    let maxLengthRule = ValidationRuleLength(max: 200, error: Validation_Error("erro"))


    
     func validationCheck() {
        
        var name = name_TextField
        var email = email_TextField
        var pass = password_TextField
        var selfIntroduction = selfIntroduction_TextView
        
        name?.validationRules = ValidationRuleSet()
        name?.validationRules?.add(rule: nameCharacterCountRule)
        name?.validateOnInputChange(enabled: true)
        name?.validationHandler = { result in self.updateSampleValidationState(result: result)
        }
        
        email?.validationRules = ValidationRuleSet()
        email?.validationRules?.add(rule: emailRule)
        email?.validateOnInputChange(enabled: true)
        email?.validationHandler = { result in self.updateSampleValidationState(result: result)
        }
        
        pass?.validationRules = ValidationRuleSet()
        pass?.validationRules?.add(rule: passwoardCharacterCountRule)
        pass?.validateOnInputChange(enabled: true)
        pass?.validationHandler = { result in self.updateSampleValidationState(result: result)
        }
        
        selfIntroduction?.validationRules = ValidationRuleSet()
        selfIntroduction?.validationRules?.add(rule: maxLengthRule)
        selfIntroduction?.validateOnInputChange(enabled: true)
        selfIntroduction?.validationHandler = { result in self.updateSampleValidationState(result: result)
        }

        
        
        
        
        
    }
    
    func updateSampleValidationState(result: ValidationResult) {
        switch result {
        case .valid:
            log.debug( "😎")
        case .invalid(let failures):
            log.debug((failures.first)?.message)
        }
    }


    
}
