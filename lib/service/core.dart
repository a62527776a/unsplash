import 'package:dio/dio.dart';
import 'dart:convert';

BaseOptions options = new BaseOptions(
  baseUrl: 'https://unsplash.com',
  responseType: ResponseType.json
);

Dio core (BaseOptions opt) {
  Dio core = new Dio(opt);
  return core;
}

var api = {
  'getFeedList': (data) => core(options).get('/napi/photos', queryParameters: data)
};