import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start PokemonApis Group Code

class PokemonApisGroup {
  static String getBaseUrl() => 'https://api.pokemontcg.io/v2/';
  static Map<String, String> headers = {};
  static PokemonCardsCall pokemonCardsCall = PokemonCardsCall();
  static SearchPokemonCardsCall searchPokemonCardsCall =
      SearchPokemonCardsCall();
}

class PokemonCardsCall {
  Future<ApiCallResponse> call({
    double? page = 1,
    int? pageSize = 20,
  }) async {
    final baseUrl = PokemonApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'PokemonCards',
      apiUrl: '${baseUrl}/cards',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResponse(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? types(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].types''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? imagesSymbol(dynamic response) => getJsonField(
        response,
        r'''$.data[:].set.images''',
        true,
      ) as List?;
  List<String>? imagesLarge(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].images.large''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imagesSmall(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].images.small''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? images(dynamic response) => getJsonField(
        response,
        r'''$.data[:].images''',
        true,
      ) as List?;
  List<String>? supertype(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].supertype''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? subtypes(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].subtypes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hp(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].hp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? evolvesFrom(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].evolvesFrom''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? attacks(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attacks''',
        true,
      ) as List?;
  List<String>? attacksName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? attacksCost(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attacks[:].cost''',
        true,
      ) as List?;
  List<int>? attacksconvertedEnergyCost(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].convertedEnergyCost''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? attacksDamage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].damage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? attacksText(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? weaknesses(dynamic response) => getJsonField(
        response,
        r'''$.data[:].weaknesses''',
        true,
      ) as List?;
  List<String>? weaknessesType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].weaknesses[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? weaknessesValue(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].weaknesses[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? retreatCost(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].retreatCost''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? resistances(dynamic response) => getJsonField(
        response,
        r'''$.data[:].resistances''',
        true,
      ) as List?;
  List<String>? resistancesType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].resistances[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? resistancesValue(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].resistances[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? convertedRetreatCost(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].convertedRetreatCost''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? set(dynamic response) => getJsonField(
        response,
        r'''$.data[:].set''',
        true,
      ) as List?;
  List<String>? setId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setSeries(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.series''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? setPrintedTotal(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.printedTotal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? setTotal(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? setLegalities(dynamic response) => getJsonField(
        response,
        r'''$.data[:].set.legalities''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setLegalitiesIdUnlimited(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.legalities.unlimited''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setPtcgoCode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.ptcgoCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setReleaseDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.releaseDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setUpdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setimagessymbol(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.images.symbol''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setimageslogo(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.images.logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? number(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? artist(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].artist''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rarity(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].rarity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? flavorText(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].flavorText''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? datanationalPokedexNumbers(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].nationalPokedexNumbers''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? legalities(dynamic response) => getJsonField(
        response,
        r'''$.data[:].legalities''',
        true,
      ) as List?;
  List<String>? legalitiesunlimited(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].legalities.unlimited''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? tcgplayerurl(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? tcgplayer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer''',
        true,
      ) as List?;
  List<String>? tcgplayerupdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? tcgplayerprices(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices''',
        true,
      ) as List?;
  List? tcgplayerpricesholofoil(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil''',
        true,
      ) as List?;
  List<double>? tcgplayerpricesholofoillow(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.low''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? tcgplayerpricesholofoilmid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.mid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<int>? tcgplayerpricesholofoilhigh(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.high''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<double>? tcgplayerpricesholofoilmarket(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.market''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List? tcgplayerpricesholofoildirectLow(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.directLow''',
        true,
      ) as List?;
  List? tcgplayerpricesreverseHolofoil(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.reverseHolofoil''',
        true,
      ) as List?;
  List<double>? tcgplayerpricesreverseHolofoillow(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.reverseHolofoil.low''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? tcgplayerpricesreverseHolofoilmid(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.reverseHolofoil.mid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<int>? tcgplayerpricesreverseHolofoilhigh(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.reverseHolofoil.high''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<double>? tcgplayerpricesreverseHolofoilmarket(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.reverseHolofoil.market''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List? tcgplayerpricesreverseHolofoildirectLow(dynamic response) =>
      getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.reverseHolofoil.directLow''',
        true,
      ) as List?;
  List? cardmarket(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cardmarket''',
        true,
      ) as List?;
  List<String>? cardmarketurl(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cardmarketupdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? cardmarketprices(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cardmarket.prices''',
        true,
      ) as List?;
  List<double>? cardmarketpricesaverageSellPrice(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.averageSellPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpriceslowPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.lowPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricestrendPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.trendPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<int>? cardmarketpricesgermanProLow(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.germanProLow''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? cardmarketpricessuggestedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.suggestedPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? cardmarketpricesreverseHoloSell(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloSell''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricesreverseHoloLow(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloLow''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricesreverseHoloTrend(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloTrend''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<int>? cardmarketpriceslowPriceExPlus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.lowPriceExPlus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? cardmarketpricesavg1(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.avg1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricesavg7(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.avg7''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricesavg30(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.avg30''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricesreverseHoloAvg1(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloAvg1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricesreverseHoloAvg7(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloAvg7''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? cardmarketpricesreverseHoloAvg30(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloAvg30''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  int? totalCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalCount''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class SearchPokemonCardsCall {
  Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    final baseUrl = PokemonApisGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SearchPokemonCards',
      apiUrl: '${baseUrl}/cards?q=set.name:${name}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? supertype(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].supertype''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? subtypes(dynamic response) => getJsonField(
        response,
        r'''$.data[:].subtypes''',
        true,
      ) as List?;
  List? evolvesTo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].evolvesTo''',
        true,
      ) as List?;
  List? rules(dynamic response) => getJsonField(
        response,
        r'''$.data[:].rules''',
        true,
      ) as List?;
  List? attacks(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attacks''',
        true,
      ) as List?;
  List<String>? attacksname(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? attacksdamage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].damage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? setname(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<int>? dataattacksconvertedEnergyCost(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].convertedEnergyCost''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? dataid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datahp(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].hp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? dataattackscost(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attacks[:].cost''',
        true,
      ) as List?;
  List? datatypes(dynamic response) => getJsonField(
        response,
        r'''$.data[:].types''',
        true,
      ) as List?;
  List<String>? dataattackstext(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attacks[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? dataweaknesses(dynamic response) => getJsonField(
        response,
        r'''$.data[:].weaknesses''',
        true,
      ) as List?;
  List<String>? dataweaknessestype(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].weaknesses[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dataweaknessesvalue(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].weaknesses[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? dataretreatCost(dynamic response) => getJsonField(
        response,
        r'''$.data[:].retreatCost''',
        true,
      ) as List?;
  List<int>? dataconvertedRetreatCost(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].convertedRetreatCost''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? dataset(dynamic response) => getJsonField(
        response,
        r'''$.data[:].set''',
        true,
      ) as List?;
  List<String>? datasetid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datasetseries(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.series''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? datasetprintedTotal(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.printedTotal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? datasettotal(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? datasetlegalities(dynamic response) => getJsonField(
        response,
        r'''$.data[:].set.legalities''',
        true,
      ) as List?;
  List<String>? datasetlegalitiesunlimited(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.legalities.unlimited''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datasetlegalitiesexpanded(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.legalities.expanded''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datasetptcgoCode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.ptcgoCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datasetreleaseDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.releaseDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? datasetimages(dynamic response) => getJsonField(
        response,
        r'''$.data[:].set.images''',
        true,
      ) as List?;
  List<String>? datasetimagessymbol(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.images.symbol''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datasetimageslogo(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.images.logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datasetupdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].set.updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datanumber(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dataartist(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].artist''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datararity(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].rarity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? datanationalPokedexNumbers(dynamic response) => getJsonField(
        response,
        r'''$.data[:].nationalPokedexNumbers''',
        true,
      ) as List?;
  List? datalegalities(dynamic response) => getJsonField(
        response,
        r'''$.data[:].legalities''',
        true,
      ) as List?;
  List<String>? datalegalitiesunlimited(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].legalities.unlimited''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datalegalitiesexpanded(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].legalities.expanded''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? dataimages(dynamic response) => getJsonField(
        response,
        r'''$.data[:].images''',
        true,
      ) as List?;
  List<String>? dataimagessmall(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].images.small''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dataimageslarge(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].images.large''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? datatcgplayer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer''',
        true,
      ) as List?;
  List<String>? datatcgplayerurl(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datatcgplayerupdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? datatcgplayerprices(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices''',
        true,
      ) as List?;
  List? datatcgplayerpricesholofoil(dynamic response) => getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil''',
        true,
      ) as List?;
  List<double>? datatcgplayerpricesholofoillow(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.low''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? holofoilmid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.mid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? holofoilhigh(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.high''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datatcgplayerpricesholofoilmarket(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.market''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List? datacardmarket(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cardmarket''',
        true,
      ) as List?;
  List<String>? datacardmarketurl(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? datacardmarketupdatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? datacardmarketprices(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cardmarket.prices''',
        true,
      ) as List?;
  List<double>? datacardmarketpricesaverageSellPrice(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.averageSellPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpriceslowPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.lowPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datatcgplayerpricesholofoildirectLow(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].tcgplayer.prices.holofoil.directLow''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricestrendPrice(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.trendPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesgermanProLow(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.germanProLow''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricessuggestedPrice(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.suggestedPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesreverseHoloSell(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloSell''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesreverseHoloLow(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloLow''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesreverseHoloTrend(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloTrend''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpriceslowPriceExPlus(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.lowPriceExPlus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesavg1(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.avg1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesavg7(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.avg7''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesavg30(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.avg30''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesreverseHoloAvg1(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloAvg1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesreverseHoloAvg7(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloAvg7''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? datacardmarketpricesreverseHoloAvg30(dynamic response) =>
      (getJsonField(
        response,
        r'''$.data[:].cardmarket.prices.reverseHoloAvg30''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

/// End PokemonApis Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
