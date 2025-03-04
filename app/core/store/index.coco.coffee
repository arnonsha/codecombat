store = new Vuex.Store({
  strict: not application.isProduction()

  state: {
    pageErrors: []
    localesLoaded: {}
    features: {}
  }

  mutations: {
    addPageError: (state, error) -> state.pageErrors.push(error)
    clearPageErrors: (state) -> state.pageErrors = []
    addLocaleLoaded: (state, localeCode) ->
      addition = {}
      addition[localeCode] = true
      state.localesLoaded = _.assign(addition, state.localesLoaded)
    updateFeatures: (state, features) -> state.features = features
  }

  getters: {
    localeLoaded: (state) => (locale) =>
      return state.localesLoaded[locale] == true
  }

  modules: {
    me: require('./modules/me').default,
    courses: require('./modules/courses'),
    game: require('./modules/game'),
    gameContent: require('./modules/gameContent').default
    schoolAdministrator: require('./modules/schoolAdministrator').default
    clans: require('./modules/clans').default
    classrooms: require('./modules/classrooms').default
    courseInstances: require('./modules/courseInstances').default
    levelSessions: require('./modules/levelSessions').default
    users: require('./modules/users').default
    campaigns: require('./modules/campaigns').default
    tracker: require('./modules/tracker').default
    products: require('./modules/products').default
    seasonalLeague: require('./modules/seasonalLeague').default,
    paymentGroups: require('./modules/paymentGroups').default,
    apiClient: require('./modules/apiClient').default,
    trialRequest: require('./modules/trialRequest').default,
    prepaids: require('./modules/prepaids').default,
    classrooms: require('./modules/classrooms').default,
    teacherDashboard: require('./modules/teacherDashboard').default,
    baseCurriculumGuide: require('ozaria/site/store/BaseCurriculumGuide').default
  }
})

module.exports = store
