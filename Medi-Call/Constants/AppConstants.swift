//
//  AppConstants.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation

final class AppConstants {
    
    enum AuthLanding {
        static let createAccountTitle = "Create New Account"
        static let loginTitle = "I already have an account"
        static let catalogImageName = "Catalog"
        
        enum AccessibilityIdentifier {
            static let createAccountButton = "createAccountButton"
            static let loginButton = "loginButton"
            static let catalogImage = "catalogImage"
        }
    }
    
    enum Login {
        static let title = "Login"
        static let emailFieldTitle = "Email"
        static let emailPlaceholder = "example@gmail.com"
        static let passwordFieldTitle = "Create a password"
        static let passwordPlaceholder = "••••••••"
        static let loginButtonTitle = "Log In"
        static let loginErrorTitle = "Login Error"
        static let loginErrorFallbackMessage = "Something went wrong"
        static let alertDismissButtonTitle = "OK"
        
        enum AccessibilityIdentifier {
            static let loginTitle = "loginTitle"
            static let emailField = "emailField"
            static let passwordField = "passwordField"
            static let loginButton = "loginButton"
            static let loginProgress = "loginProgress"
            static let loginAlert = "loginAlert"
        }
    }
    
    enum Register {
        static let title = "Create New Account"
        static let nameFieldTitle = "Name"
        static let namePlaceholder = "Alice"
        static let emailFieldTitle = "Email"
        static let emailPlaceholder = "Alice@email.com"
        static let passwordFieldTitle = "Password"
        static let passwordPlaceholder = "••••••••"
        static let createAccountButtonTitle = "Create Account"
        static let registrationErrorTitle = "Registration Error"
        static let registrationErrorFallbackMessage = "Something went wrong"
        static let alertDismissButtonTitle = "OK"
        
        enum AccessibilityIdentifier {
            static let registerTitle = "registerTitle"
            static let nameField = "nameField"
            static let emailField = "emailField"
            static let passwordField = "passwordField"
            static let registerButton = "registerButton"
            static let registerProgress = "registerProgress"
            static let registerAlert = "registerAlert"
        }
    }
    
    enum Dashboard {
        static let title = "My Medications"
        static let emptyStateMessage = "No saved medications."
        static let searchButtonTitle = "Search Medications"
        static let drugIdPrefix = "Drug Id:"
        
        enum ImageName {
            static let trayIcon = "icnTray"
        }
        
        enum AccessibilityIdentifier {
            static let title = "dashboardTitle"
            static let emptyStateText = "dashboardEmptyState"
            static let medicationCell = "medicationCell"
            static let searchButton = "dashboardSearchButton"
        }
    }
    
    enum DrugSearch {
        static let navTitle = "Search Medication"
        static let searchPlaceholder = "Search Medication"
        static let searchResultsHeader = "Search Results"
        static let searchButtonTitle = "Search"
        static let backButtonTitle = "Back"
        static let drugIdPrefix = "Drug Id:"
        static let trayImage = "icnTray"
        
        enum AccessibilityIdentifier {
            static let searchTextField = "searchTextField"
            static let searchButton = "searchButton"
            static let searchProgress = "searchProgress"
            static let searchResultList = "searchResultList"
            static let searchResultItemPrefix = "searchResultItem_"
            static let backButton = "searchBackButton"
        }
    }
    
    enum DrugDetail {
        static let navTitle = "Details"
        static let addToList = "Add Medication to List"
        static let alertTitle = "Success"
        static let alertDismiss = "OK"
        
        enum Labels {
            static let synonym = "Synonym"
            static let tty = "TTY"
            static let language = "Language"
            static let suppress = "Suppress"
            static let umlscui = "UMLS CUI"
        }
        
        enum AccessibilityIdentifier {
            static let addButton = "addMedicationButton"
            static let addProgress = "addMedicationProgress"
            static let rowPrefix = "drugDetailRow_"
        }
    }
    
    
    
}


