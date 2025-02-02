#FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS runtime
#ARG REPO=mcr.microsoft.com/dotnet/core/runtime-deps
FROM mcr.microsoft.com/dotnet/core/runtime-deps:2.2-alpine3.9
#WORKDIR /src

#COPY Serve.UI.API/Core/Serve.UI.API.Core.csproj Core/
#COPY Serve.UI.API/Host/Serve.UI.API.Host.csproj Host/
#COPY NuGet.Config .

#RUN dotnet nuget locals all --clear
#RUN dotnet restore --configfile NuGet.Config Host/Serve.UI.API.Host.csproj 
COPY . .

#RUN dotnet publish -c release -o /app Serve.UI.API/Host/Serve.UI.API.Host.csproj
#RUN rm ./NuGet.Config

#FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-alpine3.9
WORKDIR /app
#COPY --from=build /app .
#ENV ASPNETCORE_URLS=http://+:80 DOTNET_RUNNING_IN_CONTAINER=true 
ENTRYPOINT ["dotnet", "Web.dll"]
