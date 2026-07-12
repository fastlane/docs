(function () {
  'use strict';

  var storageKey = 'fastlane-docs-color-mode';
  var validPreferences = ['auto', 'light', 'dark'];
  var root = document.documentElement;
  var mediaQuery = window.matchMedia ? window.matchMedia('(prefers-color-scheme: dark)') : null;

  function isValidPreference(preference) {
    return validPreferences.indexOf(preference) !== -1;
  }

  function getPreference() {
    var preference = root.getAttribute('data-color-mode-preference');
    return isValidPreference(preference) ? preference : 'auto';
  }

  function resolveColorMode(preference) {
    if (preference !== 'auto') {
      return preference;
    }

    return mediaQuery && mediaQuery.matches ? 'dark' : 'light';
  }

  function applyPreference(preference) {
    var safePreference = isValidPreference(preference) ? preference : 'auto';
    root.setAttribute('data-color-mode', resolveColorMode(safePreference));
    root.setAttribute('data-color-mode-preference', safePreference);

    var selector = document.getElementById('color-mode-select');
    if (selector) {
      selector.value = safePreference;
    }
  }

  function storePreference(preference) {
    try {
      window.localStorage.setItem(storageKey, preference);
    } catch (error) {
      // The selected mode still applies for this page when storage is blocked.
    }
  }

  function handleSystemColorModeChange() {
    if (getPreference() === 'auto') {
      applyPreference('auto');
    }
  }

  function handleStoredPreferenceChange(event) {
    if (event.key === storageKey) {
      applyPreference(isValidPreference(event.newValue) ? event.newValue : 'auto');
    }
  }

  function initializeColorModeControl() {
    var selector = document.getElementById('color-mode-select');
    applyPreference(getPreference());

    if (selector) {
      selector.addEventListener('change', function (event) {
        var preference = event.currentTarget.value;
        applyPreference(preference);
        storePreference(preference);
      });
    }

    if (mediaQuery) {
      if (mediaQuery.addEventListener) {
        mediaQuery.addEventListener('change', handleSystemColorModeChange);
      } else if (mediaQuery.addListener) {
        mediaQuery.addListener(handleSystemColorModeChange);
      }
    }

    window.addEventListener('storage', handleStoredPreferenceChange);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initializeColorModeControl);
  } else {
    initializeColorModeControl();
  }
}());
