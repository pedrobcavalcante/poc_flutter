import 'package:flutter_test/flutter_test.dart';
import 'package:poc_flutter/core/http/validators/status_validator.dart';

void main() {
  group('StatusValidator', () {
    test('should return false when status is null', () {
      expect(StatusValidator.validate(null), false);
    });

    test('should return false for unauthorized (401)', () {
      expect(StatusValidator.validate(401), false);
      expect(StatusValidator.isUnauthorized(401), true);
    });

    test('should return true for not found (404)', () {
      expect(StatusValidator.validate(404), true);
      expect(StatusValidator.isNotFound(404), true);
    });

    test('should return false for rate limit (429)', () {
      expect(StatusValidator.validate(429), false);
      expect(StatusValidator.isRateLimited(429), true);
    });

    test('should return false for server errors (5xx)', () {
      expect(StatusValidator.validate(500), false);
      expect(StatusValidator.validate(502), false);
      expect(StatusValidator.validate(503), false);
      expect(StatusValidator.isServerError(500), true);
    });

    test('should return true for success status (2xx)', () {
      expect(StatusValidator.validate(200), true);
      expect(StatusValidator.validate(201), true);
      expect(StatusValidator.validate(204), true);
      expect(StatusValidator.isSuccess(200), true);
    });

    test('should return true for redirect status (3xx)', () {
      expect(StatusValidator.validate(301), true);
      expect(StatusValidator.validate(302), true);
      expect(StatusValidator.validate(304), true);
    });
  });
} 