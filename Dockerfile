FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base
WORKDIR /app

COPY *.sln .
COPY Form/*.csproj ./Form/
COPY Tests/*.csproj ./Tests/
RUN dotnet restore

COPY . .

FROM base AS test
WORKDIR /app/Tests
RUN dotnet test

FROM base AS publish
WORKDIR /app/Form
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-alpine AS runtime
WORKDIR /app
COPY --from=publish /app/Form/out ./
EXPOSE 80
ENTRYPOINT [ "dotnet", "Form.dll" ]