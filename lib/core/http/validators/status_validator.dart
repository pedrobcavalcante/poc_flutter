class StatusValidator {
  static bool validate(int? status) {
    if (status == null) return false;

    if (status == 401) {
      // Poderia disparar um evento de logout ou refresh token
      return false;
    }

    if (status == 404) {
      // Permite tratar 404 como resposta válida
      return true;
    }

    if (status == 429) {
      // Rate limiting - poderia implementar retry
      return false;
    }

    if (status >= 500) {
      // Erros do servidor - poderia implementar retry com backoff
      return false;
    }

    // Aceita 2xx e 3xx como sucesso
    return status >= 200 && status < 400;
  }

  // Métodos auxiliares que podem ser úteis
  static bool isUnauthorized(int status) => status == 401;
  static bool isNotFound(int status) => status == 404;
  static bool isRateLimited(int status) => status == 429;
  static bool isServerError(int status) => status >= 500;
  static bool isSuccess(int status) => status >= 200 && status < 400;
} 