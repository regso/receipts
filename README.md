# Recipes App

Recipes.

## Codegen

```
dart run build_runner build --delete-conflicting-outputs
```

## Auth

| URI                     | Auth |
|-------------------------|------|
| /auth/sign-up           | -    |
| /auth/sign-in           | -    |
| /recipes                | -+   |
| /recipes?filter=1       | -+   | 
| /recipes/{id}           | -+   |
| /user/profile           | +    |
| /user/sign-out          | +    |
| /user/favorite-receipts | +    |
| /error/not-found        | -+   |


## Design
[Proto](https://www.figma.com/proto/alUTMeT3w9XlbNf3orwyFA/Otus-Food-App)

[File](https://www.figma.com/file/alUTMeT3w9XlbNf3orwyFA/Otus-Food-App)
