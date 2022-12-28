FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

COPY *.sln .
COPY Form/*.csproj /Form
COPY Tests/*.csproj /Tests
RUN dotnet restore

FROM base AS test
WORKDIR /app/Tests
CMD ["dotnet", "test", "--logger:trx"]
RUN dotnet test

FROM base AS publish
WORKDIR /app/Form
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
COPY --from=publish /app/Form/out ./
EXPOSE 80
ENTRYPOINT [ "dotnet", "Form.dll" ]