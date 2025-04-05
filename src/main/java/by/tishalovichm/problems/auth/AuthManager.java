package by.tishalovichm.problems.auth;

import by.tishalovichm.problems.auth.data.UserIdentity;
import by.tishalovichm.problems.auth.exceptions.UnauthorizedException;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class AuthManager {

    private static final String BEARER_PREFIX = "Bearer ";

    @Value("${auth.secret}")
    private String secret;

    public UserIdentity getUserIdentity(String authorizationHeader) {
        if (!authorizationHeader.startsWith(BEARER_PREFIX)) {
            throw new UnauthorizedException();
        }

        String token = authorizationHeader.substring(BEARER_PREFIX.length());

        DecodedJWT decodedJWT;
        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);
            JWTVerifier verifier = JWT.require(algorithm)
                .withClaimPresence("id")
                .withClaimPresence("login")
                .build();

            decodedJWT = verifier.verify(token);
        } catch (JWTVerificationException exception){
            throw new UnauthorizedException();
        }

        Long id = decodedJWT.getClaim("id").asLong();
        String login = decodedJWT.getClaim("login").asString();

        return new UserIdentity(id, login);
    }

}
