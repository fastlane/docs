(function () {
  'use strict';

  var storageKey = 'fastlane-docs-color-mode';
  var preferenceCycle = ['auto', 'light', 'dark'];
  var root = document.documentElement;
  var mediaQuery = window.matchMedia ? window.matchMedia('(prefers-color-scheme: dark)') : null;
  var reducedMotionQuery = window.matchMedia ? window.matchMedia('(prefers-reduced-motion: reduce)') : null;

  function isValidPreference(preference) {
    return preferenceCycle.indexOf(preference) !== -1;
  }

  function getPreference() {
    var preference = root.getAttribute('data-color-mode-preference');
    return isValidPreference(preference) ? preference : 'auto';
  }

  function nextPreference(preference) {
    return preferenceCycle[(preferenceCycle.indexOf(preference) + 1) % preferenceCycle.length];
  }

  function describePreference(preference) {
    return preference === 'auto' ? 'auto (follows your system)' : preference;
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

    var toggle = document.getElementById('color-mode-toggle');
    if (toggle) {
      var label = 'Color mode: ' + describePreference(safePreference) +
        '. Switch to ' + describePreference(nextPreference(safePreference)) + '.';
      toggle.setAttribute('aria-label', label);
      toggle.setAttribute('title', label);
    }
  }

  function applyPreferenceWithCrossfade(preference) {
    var colorModeChanges = resolveColorMode(preference) !== root.getAttribute('data-color-mode');

    if (colorModeChanges &&
        typeof document.startViewTransition === 'function' &&
        !(reducedMotionQuery && reducedMotionQuery.matches)) {
      document.startViewTransition(function () {
        applyPreference(preference);
      });
      return;
    }

    applyPreference(preference);
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
    var toggle = document.getElementById('color-mode-toggle');
    applyPreference(getPreference());

    if (toggle) {
      toggle.addEventListener('click', function () {
        var preference = nextPreference(getPreference());
        applyPreferenceWithCrossfade(preference);
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
