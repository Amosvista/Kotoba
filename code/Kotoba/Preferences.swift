//
//  Preferences.swift
//  Kotoba
//
//  Created by Will Hains on 2016-06-10.
//  Copyright © 2016 Will Hains. All rights reserved.
//

import Foundation

// MARK:- User preferences/state

/// The user's preferences/state.
protocol Preferences
{
	/// Asks preferences if the user should be prompted to download system dictionaries.
	/// - returns: `true` if the user has never seen the prompt before; `false` otherwise.
	func shouldDisplayFirstUseDictionaryPrompt() -> Bool
	
	/// Updates preferences that the user has been prompted to download system dictionaries.
	/// Called before the user actually has done so.
	func didDisplayFirstUseDictionaryPrompt()
}

// MARK:- Preferences implementation backed by NSUserDefaults

private let _DICTIONARY_PROMPT_DISPLAYED = "firstUseDictionaryPromptDisplayed"

extension NSUserDefaults: Preferences
{
	func shouldDisplayFirstUseDictionaryPrompt() -> Bool
	{
		return !boolForKey(_DICTIONARY_PROMPT_DISPLAYED)
	}
	
	func didDisplayFirstUseDictionaryPrompt()
	{
		setBool(true, forKey: _DICTIONARY_PROMPT_DISPLAYED)
	}
}

/// The preferences/state of the current user.
let prefs: Preferences = NSUserDefaults.standardUserDefaults()
