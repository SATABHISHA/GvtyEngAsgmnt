import '/backend/api_requests/api_calls.dart';
import '/components/search_component_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    animationsMap.addAll({
      'gridViewOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 30.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'gridViewOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 30.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: Colors.yellow,
              automaticallyImplyLeading: false,
              title: Text(
                'Pokemon',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xFF514F4F),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: Colors.yellow,
                    hoverColor: Color(0xFFD8E8AA),
                    icon: Icon(
                      Icons.search_sharp,
                      color: Color(0xFF514F4F),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SearchComponentBottomSheetWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                          ),
                        ),
                      ),
                      if (!FFAppState().isSearchTrue ? true : false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 10.0, 8.0, 10.0),
                          child: RefreshIndicator(
                            onRefresh: () async {
                              safeSetState(() =>
                                  _model.gridViewPagingController?.refresh());
                              await _model.waitForOnePageForGridView();
                            },
                            child: PagedGridView<ApiPagingParams, dynamic>(
                              pagingController: _model.setGridViewController(
                                (nextPageMarker) =>
                                    PokemonApisGroup.pokemonCardsCall.call(
                                  page: valueOrDefault<double>(
                                    functions
                                        .paginationCustomIndex(
                                            nextPageMarker.nextPageNumber, 1)
                                        ?.toDouble(),
                                    1.0,
                                  ),
                                  pageSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                                childAspectRatio: 0.8,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<dynamic>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                                // Customize what your widget looks like when it's loading another page.
                                newPageProgressIndicatorBuilder: (_) => Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),

                                itemBuilder: (context, _, dataResponseIndex) {
                                  final dataResponseItem = _model
                                      .gridViewPagingController!
                                      .itemList![dataResponseIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        DetailsWidget.routeName,
                                        queryParameters: {
                                          'pageTitle': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.name''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'pokemonImage': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.images.large''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'hp': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.hp''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'superType': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.supertype''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'subType': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.subtypes''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'setName': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.set.name''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'setReleaseDate': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.set.releaseDate''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'logo': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.set.images.logo''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'setSeries': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.set.series''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'attackName': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.attacks[:].name''',
                                            ),
                                            ParamType.JSON,
                                          ),
                                          'cost': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.attacks[:].cost''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'damage': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.attacks[:].damage''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'effect': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.attacks[:].text''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'attacks': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.attacks''',
                                            ),
                                            ParamType.JSON,
                                          ),
                                          'weaknessType': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.weaknesses[:].type''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'weaknessesValue': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.weaknesses[:].value''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'resistancesType': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.resistances[:].type''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'resistancesValue': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.resistances[:].value''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'retreatCost': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.retreatCost''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'artist': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.artist''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'rarity': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.rarity''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'flavorText': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.flavorText''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'tcgplayerLow': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.tcgplayer.prices.holofoil.low''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'tcgplayerMid': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.tcgplayer.prices.holofoil.mid''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'tcgplayerHigh': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.tcgplayer.prices.holofoil.high''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'cardmarketAvgSellPrice':
                                              serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.cardmarket.prices.averageSellPrice''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'cardmarketTrend': serializeParam(
                                            getJsonField(
                                              dataResponseItem,
                                              r'''$.cardmarket.prices.trendPrice''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxHeight: 240.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                          imageUrl:
                                                              getJsonField(
                                                            dataResponseItem,
                                                            r'''$.images.small''',
                                                          ).toString(),
                                                          fit: BoxFit.contain,
                                                          alignment: Alignment(
                                                              -1.0, -1.0),
                                                        ),
                                                        allowRotation: false,
                                                        tag: getJsonField(
                                                          dataResponseItem,
                                                          r'''$.images.small''',
                                                        ).toString(),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: getJsonField(
                                                    dataResponseItem,
                                                    r'''$.images.small''',
                                                  ).toString(),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 100),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 100),
                                                    imageUrl: getJsonField(
                                                      dataResponseItem,
                                                      r'''$.images.small''',
                                                    ).toString(),
                                                    width: 160.0,
                                                    height: 160.0,
                                                    fit: BoxFit.none,
                                                    alignment:
                                                        Alignment(-1.0, -1.0),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  getJsonField(
                                                    dataResponseItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF1E1D1D),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['gridViewOnPageLoadAnimation1']!),
                        ),
                      if (!(FFAppState().isSearchTrue ? false : true))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 10.0, 8.0, 10.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter2 ??=
                                    Completer<ApiCallResponse>()
                                      ..complete(PokemonApisGroup
                                          .searchPokemonCardsCall
                                          .call(
                                        name: FFAppState().TxtSearch,
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final gridViewSearchSearchPokemonCardsResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final dataResponseSearch = getJsonField(
                                    gridViewSearchSearchPokemonCardsResponse
                                        .jsonBody,
                                    r'''$.data''',
                                  ).toList();

                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model
                                          .waitForApiRequestCompleted2();
                                    },
                                    child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12.0,
                                        mainAxisSpacing: 12.0,
                                        childAspectRatio: 0.8,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: dataResponseSearch.length,
                                      itemBuilder:
                                          (context, dataResponseSearchIndex) {
                                        final dataResponseSearchItem =
                                            dataResponseSearch[
                                                dataResponseSearchIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              DetailsWidget.routeName,
                                              queryParameters: {
                                                'pageTitle': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'pokemonImage': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.images.large''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'hp': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.hp''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'superType': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.supertype''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'subType': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.subtypes''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'setName': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.set.name''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'setReleaseDate':
                                                    serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.set.releaseDate''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'logo': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.set.images.logo''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'setSeries': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.set.series''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'attackName': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.attacks[:].name''',
                                                  ),
                                                  ParamType.JSON,
                                                ),
                                                'cost': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.attacks[:].cost''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'damage': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.attacks[:].damage''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'effect': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.attacks[:].text''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'attacks': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.attacks''',
                                                  ),
                                                  ParamType.JSON,
                                                ),
                                                'weaknessType': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.weaknesses[:].type''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'weaknessesValue':
                                                    serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.weaknesses[:].value''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'resistancesType':
                                                    serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.resistances[:].type''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'resistancesValue':
                                                    serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.resistances[:].value''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'retreatCost': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.retreatCost''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'artist': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.artist''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'rarity': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.rarity''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'flavorText': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.flavorText''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'tcgplayerLow': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.tcgplayer.prices.holofoil.low''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'tcgplayerMid': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.tcgplayer.prices.holofoil.mid''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'tcgplayerHigh': serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.tcgplayer.prices.holofoil.high''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'cardmarketAvgSellPrice':
                                                    serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.cardmarket.prices.averageSellPrice''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'cardmarketTrend':
                                                    serializeParam(
                                                  getJsonField(
                                                    dataResponseSearchItem,
                                                    r'''$.cardmarket.prices.trendPrice''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              constraints: BoxConstraints(
                                                maxHeight: 240.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            100),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            100),
                                                                imageUrl:
                                                                    getJsonField(
                                                                  dataResponseSearchItem,
                                                                  r'''$.images.small''',
                                                                ).toString(),
                                                                fit: BoxFit
                                                                    .contain,
                                                                alignment:
                                                                    Alignment(
                                                                        -1.0,
                                                                        -1.0),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: getJsonField(
                                                                dataResponseSearchItem,
                                                                r'''$.images.small''',
                                                              ).toString(),
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: getJsonField(
                                                          dataResponseSearchItem,
                                                          r'''$.images.small''',
                                                        ).toString(),
                                                        transitionOnUserGestures:
                                                            true,
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                          imageUrl:
                                                              getJsonField(
                                                            dataResponseSearchItem,
                                                            r'''$.images.small''',
                                                          ).toString(),
                                                          width: 160.0,
                                                          height: 160.0,
                                                          fit: BoxFit.none,
                                                          alignment: Alignment(
                                                              -1.0, -1.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        getJsonField(
                                                          dataResponseSearchItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .interTight(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF1E1D1D),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'gridViewOnPageLoadAnimation2']!);
                                },
                              );
                            },
                          ),
                        ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
