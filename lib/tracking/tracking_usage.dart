import "package:firebase_analytics/firebase_analytics.dart";
import "package:firebase_analytics/observer.dart";

class TrackingUsage {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver appAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

//MARK: track specific events
  Future<void> sendAnalyticsEvent() async {
    await _analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'string': 'string',
        'int': 42,
        'long': 12345678910,
        'double': 42.0,
        // Only strings and numbers (ints & doubles) are supported for GA custom event parameters:
        // https://developers.google.com/analytics/devguides/collection/analyticsjs/custom-dims-mets#overview
        'bool': true.toString(),
        'items': []
      },
    );
  }

//MARK: uupdate or set user id
  Future<void> setUserId() async {
    await _analytics.setUserId(id: 'some-user');
  }

//MARK: track screen
  Future<void> setCurrentScreen() async {
    await _analytics.setCurrentScreen(
      screenName: 'Analytics Demo',
      screenClassOverride: 'AnalyticsDemo',
    );
  }

//MARK: enable analytics
  Future<void> setAnalyticsCollectionEnabled() async {
    await _analytics.setAnalyticsCollectionEnabled(false);
    await _analytics.setAnalyticsCollectionEnabled(true);
  }

//MARK: set session timeout options
  Future<void> setSessionTimeoutDuration() async {
    await _analytics
        .setSessionTimeoutDuration(const Duration(milliseconds: 20000));
  }

  //MARK: set user properties
  Future<void> setUserProperty() async {
    await _analytics.setUserProperty(name: 'regular', value: 'indeed');
  }

  //MARK: all inbuilt events
  Future<void> allEventTypes() async {
    await _analytics.logAddPaymentInfo();
    await _analytics.logAddToCart(
      currency: 'USD',
      value: 123,
      items: [],
    );
    await _analytics.logAddToWishlist();
    await _analytics.logAppOpen();
    await _analytics.logBeginCheckout(
      value: 123,
      currency: 'USD',
      items: [],
    );
    await _analytics.logCampaignDetails(
      source: 'source',
      medium: 'medium',
      campaign: 'campaign',
      term: 'term',
      content: 'content',
      aclid: 'aclid',
      cp1: 'cp1',
    );
    await _analytics.logEarnVirtualCurrency(
      virtualCurrencyName: 'bitcoin',
      value: 345.66,
    );

    await _analytics.logGenerateLead(
      currency: 'USD',
      value: 123.45,
    );
    await _analytics.logJoinGroup(
      groupId: 'test group id',
    );
    await _analytics.logLevelUp(
      level: 5,
      character: 'witch doctor',
    );
    await _analytics.logLogin(loginMethod: 'login');
    await _analytics.logPostScore(
      score: 1000000,
      level: 70,
      character: 'tiefling cleric',
    );
    await _analytics.logPurchase(
        currency: 'USD', transactionId: 'transaction-id');
    await _analytics.logSearch(
      searchTerm: 'hotel',
      numberOfNights: 2,
      numberOfRooms: 1,
      numberOfPassengers: 3,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-16',
      travelClass: 'test travel class',
    );
    await _analytics.logSelectContent(
      contentType: 'test content type',
      itemId: 'test item id',
    );
    await _analytics.logSelectPromotion(
      creativeName: 'promotion name',
      creativeSlot: 'promotion slot',
      items: [],
      locationId: 'United States',
    );
    await _analytics.logSelectItem(
      items: [],
      itemListName: 't-shirt',
      itemListId: '1234',
    );
    await _analytics.logScreenView(
      screenName: 'tabs-page',
    );
    await _analytics.logViewCart(
      currency: 'USD',
      value: 123,
      items: [],
    );
    await _analytics.logShare(
      contentType: 'test content type',
      itemId: 'test item id',
      method: 'facebook',
    );
    await _analytics.logSignUp(
      signUpMethod: 'test sign up method',
    );
    await _analytics.logSpendVirtualCurrency(
      itemName: 'test item name',
      virtualCurrencyName: 'bitcoin',
      value: 34,
    );
    await _analytics.logViewPromotion(
      creativeName: 'promotion name',
      creativeSlot: 'promotion slot',
      items: [],
      locationId: 'United States',
      promotionId: '1234',
      promotionName: 'big sale',
    );
    await _analytics.logRefund(
      currency: 'USD',
      value: 123,
      items: [],
    );
    await _analytics.logTutorialBegin();
    await _analytics.logTutorialComplete();
    await _analytics.logUnlockAchievement(id: 'all Firebase API covered');
    await _analytics.logViewItem(
      currency: 'usd',
      value: 1000,
      items: [],
    );
    await _analytics.logViewItemList(
      itemListId: 't-shirt-4321',
      itemListName: 'green t-shirt',
      items: [],
    );
    await _analytics.logViewSearchResults(
      searchTerm: 'test search term',
    );
  }
}
