FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Form/Form.csproj", "."]
COPY ["Tests/Tests.csproj", "."]
RUN dotnet restore "Form.csproj"
RUN dotnet restore "Tests.csproj"
COPY . .
RUN dotnet test "../Tests/"
RUN dotnet build "Form.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Form.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Form.dll"]
